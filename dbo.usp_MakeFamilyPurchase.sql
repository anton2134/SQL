create procedure dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255)) as
set nocount on;
select dbo.Family.SurName 
from dbo.Family 
where dbo.Family.SurName = @FamilySurName;
