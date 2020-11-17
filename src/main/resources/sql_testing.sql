select * from DimProduct;
select * from DimVendor;

select * from VendorProduct;
select * from DimModel;



DROP TABLE IF EXISTS `retailsales`.`Sales`;
DROP TABLE IF EXISTS `retailsales`.`VendorProduct`;
DROP TABLE IF EXISTS `retailsales`.`DimVendor`;
DROP TABLE IF EXISTS `retailsales`.`DimBrand`;
DROP TABLE IF EXISTS `retailsales`.`DimModel`;
DROP TABLE IF EXISTS `retailsales`.`DimProduct`;
DROP TABLE IF EXISTS `retailsales`.`DimProductSubcategory`;
DROP TABLE IF EXISTS `retailsales`.`DimProductCategory`;
DROP TABLE IF EXISTS `retailsales`.`DimCustomer`;
DROP TABLE IF EXISTS `retailsales`.`DimDate`;
DROP TABLE IF EXISTS `retailsales`.`DimGeography`;


select VendorKey,ProductKey ,COUNT(*)
from VendorProduct
group by VendorKey,ProductKey
having COUNT(*) > 1

select vp.PK,vp.VendorKey,vp.ProductKey from VendorProduct vp
join VendorProduct vp1 on vp1.VendorKey = vp.VendorKey
  and vp1.ProductKey = vp.ProductKey
  and vp.PK > vp1.PK

delete vp from VendorProduct vp
join VendorProduct vp1 on vp1.VendorKey = vp.VendorKey
  and vp1.ProductKey = vp.ProductKey
  and vp.PK > vp1.PK


select VendorKey,COUNT(*)
from VendorProduct
group by VendorKey




select VendorKey ,COUNT(*)
from VendorProduct 

select PK from VendorProduct VP1 where PK not in (

select PK1,v1,p1 from (
select MAX(PK) PK1,VendorKey v1,ProductKey p1,COUNT(*)
from VendorProduct VP1
group by VendorKey,ProductKey
having COUNT(*) > 1

) t1


)
order by PK

