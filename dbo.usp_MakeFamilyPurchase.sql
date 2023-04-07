create procedure dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255)) as
begin
set nocount on;
declare @FamilyBudgetValue decimal(18,2);
set @FamilyBudgetValue =0;
if exists (select * from dbo.Family where SurName = @FamilySurName)
begin
select @FamilyBudgetValue from dbo.Family where SurName = @FamilySurName;
update dbo.Family 
set BudgetValue = @FamilyBudgetValue - (select sum(Value) from dbo.Basket
where dbo.Family.SurName = @FamilySurName)
end
else begin raiserror('Такой семьи нет', 16,1);
end
return 0;
end
go
