create view dbo.vw_SKUPrice
as
select dbo.SKU.Code, dbo.SKU.ID, dbo.SKU.Name, dbo.udf_GetSKUPrice(dbo.SKU.ID) as cost
from dbo.SKU
