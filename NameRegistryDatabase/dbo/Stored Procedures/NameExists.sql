CREATE PROCEDURE [dbo].[NameExists](@name as nvarchar(100))
AS
  select count(*) from dbo.NameRegistry nr where nr.Name = @name