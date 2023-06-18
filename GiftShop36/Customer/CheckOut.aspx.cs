using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_CheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void checkoutButton_Click(object sender, EventArgs e)
    {
        using(GiftShopEntities db = new GiftShopEntities())
        {
            MainOrderTable m = new MainOrderTable();
            m.firstName = firstname.Text;
            m.lastName = lastName.Text;
            m.email = email.Text;
            m.address = address.Text;
            m.phoneNo = phoneNo.Text;
            m.createdAt = DateTime.Now;

            db.MainOrderTables.Add(m);
            db.SaveChanges();

            if (Request.Cookies["giftShopCustomerID"] != null)
            {
                OrderDetailTable h = new OrderDetailTable();
                string uniqueID = Request.Cookies["giftShopCustomerID"]["uniqueID"];
                var cartItems = db.getCartProduct(uniqueID).ToList();

                if (cartItems.Count > 0)
                {
                    foreach (var c in cartItems)
                    {
                        h.ProductID = c.ProductID;
                        h.ProductPrice = Convert.ToInt32(c.ProductPrice);
                        h.useruniqueID = m.UserID.ToString();

                        db.OrderDetailTables.Add(h);
                        db.SaveChanges();
                    }
                }
            }

            //bool emailSent = Email.SendEmail(email.Text, "", "Your Order has been placed successfully", "GiftShop", "");
            //if (emailSent)
            //{
            //    Console.WriteLine("Email sent successfully");
            //}
            //else
            //{
            //    Console.WriteLine("Error sending email");
            //}

            String message = "Your Order has been placed successfully";

            Email.SendEmail(email.Text, "GiftShop", message, "", "");

        }

    }
}

public class Email
{
    public static bool SendEmail(string toadd, string subject, string msg, string cc = "", string bcc = "")
    {
        MailMessage message = new MailMessage();
        SmtpClient client = new SmtpClient();
        try
        {
            string SendingEmail = "", MailServer = "", SendingPassword = "";
            SendingEmail = "moneebbhatti987@gmail.com";
            MailServer = "smtp.gmail.com";
            SendingPassword = "ubtuvzyvqarffwbu";
            int ServerPort = 587;
            message.IsBodyHtml = true;

            message.From = new MailAddress(SendingEmail, "Noreply");

            if (toadd.Contains(","))
            {
                string[] arrto = toadd.Split(',');
                for (int i = 0; i <= arrto.Length - 1; i++)
                {
                    if (!string.IsNullOrEmpty(arrto[i].Trim()))
                    {
                        message.To.Add(new MailAddress(arrto[i].Trim()));
                    }
                }
            }
            else
            {
                message.To.Add(new MailAddress(toadd.ToString()));
            }

            if (!string.IsNullOrEmpty(cc))
            {
                message.CC.Add(new MailAddress(cc.ToString()));
            }

            if (!string.IsNullOrEmpty(bcc))
            {
                message.Bcc.Add(new MailAddress(bcc.ToString()));
            }
            message.Body = msg;
            message.Subject = subject;

            client.Host = MailServer;
            client.Port = ServerPort;
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential(SendingEmail, SendingPassword);

            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(message);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            message = null;
            client = null;
        }
    }
}