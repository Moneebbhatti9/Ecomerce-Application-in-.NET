using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Customer : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StoreUniqueIDinCookies();
    }


    private string GenerateUniqueId()
    {
        var uniqueID = $@"{DateTime.Now.Ticks}";
        return uniqueID;
    }


    private void StoreUniqueIDinCookies()
    {
       
        if (Request.Cookies["giftShopCustomerID"] == null)
        {
            Response.Cookies["giftShopCustomerID"]["uniqueID"] = GenerateUniqueId();
            Response.Cookies["giftShopCustomerID"].Expires = DateTime.Now.AddDays(3);
        }
    }

}
