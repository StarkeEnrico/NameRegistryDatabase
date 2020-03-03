
CREATE PROCEDURE [dbo].[AutoGenDeviceName_V2]
   @CountryIso3166A2 char(2)
 , @UsageTypeId char(1)
 , @DeviceTypeShortName varchar(3)
 , @AutoGenDeviceName nvarchar(255) OUTPUT
AS

-- Description: Auto Generates a device name
-- Author:      Johann A. Coulon 
-- Version:     1.20
-- Build:       20180702.1129

SET NOCOUNT ON

DECLARE @maxlen tinyint
DECLARE @seq varchar(6)
DECLARE @reuseFreeNumbers bit
SET @reuseFreeNumbers = 0	-- Set to 1 to find free numbers in between, set to 0 to next number in sequence
SET @maxlen = 5   -- Maximum char lenght of sequence number

IF @reuseFreeNumbers = 0
	BEGIN
		SELECT @seq = RIGHT('00000' + CONVERT(varchar(5), MAX(SUBSTRING(dev.[Name], PatIndex('%[0-9]%', dev.[Name]), @maxlen))	+ 1), @maxlen)
				  FROM dbo.Registrations AS dev
				  WHERE SUBSTRING(dev.[Name],4,LEN(@DeviceTypeShortName)) = @DeviceTypeShortName
		SELECT @AutoGenDeviceName = @CountryIso3166A2 + @UsageTypeId + @DeviceTypeShortName + @seq
	END
ELSE
	BEGIN
		-- Create temp. table for sequence numbers
		DECLARE @sequence TABLE (seq int)

		-- Create temp. table for final result
		DECLARE @result TABLE (seq varchar(10))

		DECLARE @c int,@range int
	
		SET @c = 1		  -- Counter, start at 1
		SET @range = 100  -- Set the range where the next check for a free number should occur (performance optimization)

		/*
		PRINT 'Auto-Generating Device Name'
		PRINT ' @CountryIso3166A2 = ' + @CountryIso3166A2
		PRINT ' @UsageTypeId = ' + CONVERT(varchar(100),@UsageTypeId)
		PRINT ' @DeviceTypeShortName = ' + @DeviceTypeShortName
		*/

		-- Start counter and count until the end
		WHILE LEN(@c) < @maxlen + 1
			BEGIN
				INSERT INTO @sequence VALUES(@c)
				-- If counter has reached the next range, check for free sequence number
				IF @c = @range
					BEGIN
						INSERT INTO @result
						SELECT TOP 1 REPLICATE('0',@maxlen - LEN(seq)) + CONVERT(varchar(10),seq)
						FROM @sequence
						WHERE seq NOT IN
							(
							  -- Extract Sequence number from the given devicetype
							  SELECT SUBSTRING(dev.[Name], PatIndex('%[0-9]%', dev.[Name]), @maxlen)
							  FROM Registrations AS dev
							  WHERE SUBSTRING(dev.[Name],4,LEN(@DeviceTypeShortName)) = @DeviceTypeShortName
							)
						GROUP BY seq
						-- was there a free sequence number?
						IF @@ROWCOUNT = 1
							BREAK
						ELSE
							SET @range = @range + @range	-- No, there was no free sequence number in this range
					END
						SET @c = @c + 1 -- increase counter
						CONTINUE
			END

		SELECT @AutoGenDeviceName = @CountryIso3166A2 + @UsageTypeId + @DeviceTypeShortName + seq FROM @result
	END