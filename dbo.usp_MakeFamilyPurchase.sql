create procedure dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255)) as
begin
set nocount on;
if exists (select * from dbo.Family where SurName = @FamilySurName)
begin
update dbo.Family 
set BudgetValue = dbo.Family.BudgetValue - (select sum(Value) from dbo.Basket
where dbo.Family.SurName = @FamilySurName)
end
else begin raiserror('Такой семьи нет', 16,1);
end
return 0;
end
go
