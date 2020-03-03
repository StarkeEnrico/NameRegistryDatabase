CREATE PROCEDURE dbo.usp_RegistrationNextServiceSequence
(
	  @ServiceID int
	, @ServiceRegionID int
	, @ProviderAccountId int
	, @Result int OUTPUT
)
AS 
/*
	.SYNOPSIS
	Determine the next sequence number based of a service.
	It further filters by region and provider account when the SequenceType is set to limit the output as such.

	.PARAMETER ServiceID
	Defines the ID of the Service to filter for

	.PARAMETER ServiceRegionID
	Defines the ID of the Service Region to further filter when the SequenceType is set to [R] or [AR]

	.PARAMETER ProviderAccountID
	Defines the ID of the Provider Account to further filter whent the SequenceType is set to [A] or [AR]

	.OUTPUT
	The last numerical sequence for the specified service.
*/
BEGIN
	DECLARE @seqLength int, @seqMax int 
	SELECT @seqLength = [SequenceLength] FROM Service WHERE ID = @ServiceID
	SET @seqMax = REPLICATE(9,@seqLength)

	DECLARE @countryCode char(2)
	SELECT @countryCode = CountryCode FROM ServiceRegion WHERE ID = @ServiceRegionID

	DECLARE @ServiceSequenceTypeID varchar(10)
	SELECT @ServiceSequenceTypeID = [ServiceSequenceTypeID] FROM [Service] WHERE ID = @ServiceID

	DECLARE @lastSeqQuery nvarchar(max)
	SET @lastSeqQuery = 'SELECT ISNULL(
			MAX(
				CAST(
					SUBSTRING(
						  r.[Name]
						, PatIndex(''%[0-9]%'', r.[Name])
						, ' + CAST(@seqLength AS nvarchar(10)) + 
					')
					AS int)
				)
			,0
		)
	FROM Registrations r
	WHERE ServiceID = ' + CAST(@serviceID AS nvarchar(10))

	SELECT @lastSeqQuery = 
		CASE @ServiceSequenceTypeID
		  WHEN 'G'	THEN @lastSeqQuery
		  WHEN 'R'	THEN @lastSeqQuery + CONCAT(' AND ServiceRegionID = ', @ServiceRegionID)
		  WHEN 'A'  THEN @lastSeqQuery + CONCAT(' AND r.ProviderAccountID = ', @providerAccountId)
		  WHEN 'AR' THEN @lastSeqQuery + CONCAT(' AND r.ProviderAccountID = ', @providerAccountId,' AND ServiceRegionID = ', @ServiceRegionID)
		END

	DECLARE @nextSequence int
	DECLARE @lastSeq TABLE (Seq int)
	
	INSERT INTO @lastSeq EXEC (@lastSeqQuery)
	SELECT @nextSequence = Seq + 1 FROM @lastSeq
	
	IF (@nextSequence > @seqMax)
	BEGIN
		RAISERROR ('The sequence number has been exhausted for this service.', 16, 1);
		RETURN
	END

	SELECT @Result = @nextSequence
END