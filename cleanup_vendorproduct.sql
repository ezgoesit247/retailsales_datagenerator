delete vp from VendorProduct vp
join VendorProduct vp1 on vp1.VendorKey = vp.VendorKey
  and vp1.ProductKey = vp.ProductKey
  and vp.PK > vp1.PK;