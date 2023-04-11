create function dbo.udf_GetSKUPrice (@ID_SKU int) returns decimal(18,2)
as 
begin
declare @cost decimal;
select @cost = sum(dbo.Basket.Value)/sum(dbo.Basket.Quantity)
from dbo.Basket
where dbo.Basket.ID_SKU = @ID_SKU;
return @cost
end;
