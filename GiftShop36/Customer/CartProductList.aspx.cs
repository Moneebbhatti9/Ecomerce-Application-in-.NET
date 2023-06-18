using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_CartProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        fetchCartProducts();

    }

    protected void fetchCartProducts()
    {
        
        using (GiftShopEntities db = new GiftShopEntities())
        {
            if (Request.Cookies["giftShopCustomerID"] != null)
            {
                string uniqueID = Request.Cookies["giftShopCustomerID"]["uniqueID"];
                var cartItems = db.getCartProduct(uniqueID).ToList();

                if (cartItems.Count > 0)
                {
                    GVCartItem.DataSource = cartItems;
                    GVCartItem.DataBind();
                }

                var TotalPrice = 0.0;
                foreach (var item in cartItems)
                {
                    TotalPrice += ((double)item.ProductPrice);

                }
                total_text.InnerText = TotalPrice.ToString();
            }
           
            

        }
    }

    protected void moveToCheckout(object sender, CommandEventArgs e)
    {
        Response.Redirect("./CheckOut.aspx");
    }

    // =================================================================== This function is used to delete cart items
    

protected void GVCartItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GVCartItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "delete")
        {
            using (GiftShopEntities db = new GiftShopEntities())
            {
                int productID = Convert.ToInt32(e.CommandArgument);
                db.deleteProductFromCart(productID);
            }
            
            fetchCartProducts();

        }


    }
}