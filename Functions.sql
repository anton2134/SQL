create function dbo.GetSum (@ID_SKU int) returns decimal(18,2) 
as 
begin
declare @st decimal(18,2);
select @st = sum(B.Value)/sum(B.Quantity)
from dbo.Basket as B
where B.ID = @ID_SKU;
return @st;
end;