CREATE VIEW vw_Registrations
AS

SELECT 
	 r.ID
	,LOWER(r.[Name]) AS [Name]
	,LOWER(r.[Suffix]) AS [Suffix]
	,e.Name [Environment]
	,p.Name [Provider]
	,pa.Account [Account]
	,sr.Name [ServiceRegion]
	,sr.CountryCode 
	,c.GeoRegion
	,s.Name [Service]
	,s.Shortname [ShortName]
	,rs.Name [RegistrationStatus]
	,r.CreatedBy
	,r.ChangedBy
	,r.WhenCreated
	,r.WhenChanged
	,CONCAT(p.Name,'/',pa.Account,'/',sr.Name,'/',LOWER(r.[Name])) AS CanonicalName

FROM [Registrations] r
LEFT OUTER JOIN [Environment] e ON r.EnvironmentID = e.ID
LEFT OUTER JOIN [ProviderAccount] pa ON r.ProviderAccountID = pa.ID
LEFT OUTER JOIN [Provider] p ON pa.ProviderID = p.ID
LEFT OUTER JOIN [ServiceRegion] sr ON r.ServiceRegionID = sr.ID
LEFT OUTER JOIN [Service] s ON r.ServiceID = s.ID
LEFT OUTER JOIN [RegistrationStatus] rs ON r.RegistrationStatusID = rs.ID
LEFT OUTER JOIN [Country] c ON sr.CountryCode = c.CountryCode