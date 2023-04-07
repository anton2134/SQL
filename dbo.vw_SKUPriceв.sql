select dbo.SKU.Code, dbo.SKU.ID, dbo.SKU.Name, dbo.udf_GetSKUPrice(ID_SKU) as cost
from dbo.SKU join dbo.Basket on dbo.SKU.ID=dbo.Basket.ID_SKU;
