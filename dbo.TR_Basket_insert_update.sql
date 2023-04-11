create trigger dbo.TR_Basket_insert_update on dbo.Basket after insert, update as 
begin
declare @ID_SKU int;
select @ID_SKU = ID_SKU from inserted;
if (select count(*) from dbo.Basket where ID_SKU = @ID_SKU)>1
begin update B 
set B.DiscountValue = B.DiscountValue
from dbo.Basket as B
where B.ID_SKU = @ID_SKU;
end
else if (select count(*)
from dbo.Basket
where ID_SKU = @ID_SKU) <=1
begin update B set B.DiscountValue = 0 
from dbo.Basket as B
where B.ID_SKU =@ID_SKU;
end
end