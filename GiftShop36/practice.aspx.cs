using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class practice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        /* UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
         if (IsPostBack) return;
         using(GiftShopEntities db = new GiftShopEntities())
         {
             var brands = db.getBrand().ToList();
             ddbrand.DataTextField = "BrandName";
             ddbrand.DataValueField = "BrandID";

             cblbrand.DataTextField = "BrandName";
             cblbrand.DataValueField = "BrandID";


             ddbrand.DataSource = brands;
             ddbrand.DataBind();
             ddbrand.Items.Insert(0, new ListItem("Select", "0"));



         }*/

    }
}