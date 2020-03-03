
CREATE PROCEDURE usp_RegistrationNewObject
(
	@ProviderAccountId int
   ,@EnvironmentId char(1)
   ,@ServiceId int
   ,@ServiceRegionId int
   ,@StatusId int 
   ,@CreatedBy nvarchar(50)
   ,@Suffix nvarchar(50) = NULL
)
AS
BEGIN
	/*
		.SYNOPSIS
		Perform a new object registration

		.PARAMETER ProviderAccountId
		Defines the identifier of the Provider Account

		.PARAMETER EnvironmentId
		Defines the identifier of the Environment

		.PARAMETER ServiceId
		Defines the identifier of the Service

		.PARAMETER ServiceRegionId
		Defines the identifier of the ServiceRegion

		.PARAMETER StatusId
		Defines the identifier of the RegistrationStatus
		
		.PARAMETER CreatedBy
		Defines the creator of the object

		.PARAMETER Suffix
		Optional value for a suffix
	*/

	DECLARE @nextSeq varchar(10), @nextSeqString varchar(20), @serviceSequenceLength tinyint, @pattern varchar(50)
	DECLARE @CountryCode char(2), @ServiceShortName varchar(5)

	SELECT @CountryCode = CountryCode FROM [ServiceRegion] WHERE ID = @serviceRegionID

	SELECT @serviceSequenceLength = SequenceLength
		 , @pattern = dbo.ufn_ServiceNamePattern(ID)
		 , @serviceShortName = ShortName
	FROM [Service] WHERE ID = @serviceID

	EXEC dbo.usp_RegistrationNextServiceSequence @serviceID, @serviceRegionID, @providerAccountId, @nextSeq OUTPUT

	SELECT @nextSeqString = RIGHT(CONCAT(REPLICATE('0', @serviceSequenceLength), CAST(@nextSeq AS varchar(20))), @serviceSequenceLength)

	DECLARE @objectName varchar(255)
	SET @objectName = @pattern
	SET @objectName = REPLACE(@objectName, '{CountryCode}', @CountryCode)
	SET @objectName = REPLACE(@objectName, '{Environment}', @EnvironmentId)
	SET @objectName = REPLACE(@objectName, '{ServiceType}', @serviceShortName)
	SET @objectName = REPLACE(@objectName, '{Sequence}', @nextSeqString)

	DECLARE @registrationID uniqueidentifier
	SET @registrationID = NEWID()

	INSERT INTO Registrations ([ID], [Name], EnvironmentId, Suffix, ProviderAccountID, ServiceID, ServiceRegionID, RegistrationStatusID, CreatedBy)
		 VALUES (@registrationID, LOWER(@objectName), @EnvironmentId, @Suffix, @ProviderAccountId, @ServiceId, @serviceRegionID, @StatusId, @CreatedBy)

	SELECT * FROM Registrations WHERE ID = @registrationID
END