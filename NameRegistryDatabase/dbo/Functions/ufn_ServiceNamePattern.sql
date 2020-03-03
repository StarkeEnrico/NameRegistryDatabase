CREATE FUNCTION dbo.ufn_ServiceNamePattern (@ServiceID int)
	RETURNS varchar(255)
AS
BEGIN

	/*
		.SYNOPSIS
		Returns the name pattern for a service if such is defined specifically.
		Alternatively returns the DefaultNamePattern from the Defaults table.

		.PARAMETER ServiceID
		Identifier of the Service
	*/

	DECLARE @pattern varchar(255)
	DECLARE @defaultPattern varchar(255)

	SELECT @defaultPattern = [Value] FROM [Defaults] WHERE Property = 'DefaultNamePattern'

	SELECT @pattern = NamePattern
	FROM [NamePattern]
	WHERE ServiceID = @ServiceID

	RETURN (SELECT ISNULL(@pattern, @defaultPattern))
END