﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.Web.Security;

namespace SICE.admin.usuarios
{
    public partial class UserEdit : System.Web.UI.Page
    {
        ApplicationUserManager manager;
        RoleManager<IdentityRole> roleManager;
        Models.ApplicationUser user;
        


        protected void Page_Init(object sender, EventArgs e)
        {
            ID.Value = Request["Id"];
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            roleManager = Request.GetOwinContext().Get<RoleManager<IdentityRole>>();
            user = manager.FindById(Request["Id"]);
            if(user != null)
            {
                habilitadoText.InnerText = textHabilitado((getHabilitado(Request["Id"]) == "1") ? true : false);
                habilitado.InnerText = (getHabilitado(Request["Id"]) == "1") ? "Deshabilitar" : "Habilitar";
            }
            

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            FailureText.Text = "";
            ErrorMessage.Visible = false;
        }


        protected void Page_PreRender()
        {
            
            if (user == null)
            {
                Response.Redirect("/admin/usuarios/UserList");
            }

            if(email.Value == "")
                email.Value = user.Email;

            rolSelect.SelectedValue = "0";
            if (username.Value == "")
                username.Value = user.UserName;


        }


        protected String getHabilitado(String userId)
        {

            SqlConnection conn = new SqlConnection(connectionString: ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();

            SqlCommand command = new SqlCommand("Select Habilitado from [AspNetUsers] where Id='"+ userId + "'", conn);
            return  command.ExecuteScalar().ToString();
        }

        protected void guardarDatos(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //Procedemos a guardar info que ha cambiado.
                if(user.Email != email.Value)
                {
                    //Chequeamos que el mail sea correcto
                    if (new EmailAddressAttribute().IsValid(email.Value))
                    {
                        user.Email = email.Value;
                    }
                }

                //Procedemos a guardar info que ha cambiado.
                if (user.UserName != username.Value)
                {
                    //Chequeamos que el mail sea correcto
                    if (username.ToString().Length >= 3)
                    {
                        user.UserName = username.Value;
                    }
                }

                if (rolSelect.SelectedValue != "0")
                {
                    if (User.Identity.GetUserId().Equals(user.Id))
                    {
                        FailureText.Text = "No se puede cambiar el rol a sí mismo";
                        ErrorMessage.Visible = true;
                        rolSelect.SelectedValue = "0";
                        return;
                    }
                    try
                    {
                        Roles.RemoveUserFromRole(user.UserName, "Admin");

                        Roles.RemoveUserFromRole(user.UserName, "Usuario");
                    }
                    catch (Exception err) { }
                    Roles.AddUserToRole(user.UserName, rolSelect.SelectedValue);

                }

                manager.Update(user);





            }

        }

        protected String textHabilitado(Boolean hab)
        {
            if(hab == true)
            {
                return "Habilitado";
            }
            return "Deshabilitado";
        }

        protected void habilitado_ServerChange(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (User.Identity.GetUserId().Equals(user.Id))
                {
                    FailureText.Text = "No te puedes bloquear a tí mismo";
                    ErrorMessage.Visible = true;
                    return;
                }
                SqlConnection conn = new SqlConnection(connectionString: ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();
                var newValue = (habilitadoText.InnerText.Equals("Habilitado")) ? "0" : "1";

                SqlCommand command = new SqlCommand("UPDATE [AspNetUsers] SET Habilitado = '" + newValue + "' where Email='" + user.Email + "'", conn);
                command.ExecuteNonQuery();
                habilitadoText.InnerText = textHabilitado(!habilitadoText.InnerText.Equals("Habilitado"));
                habilitado.InnerText = (newValue.Equals("1")) ? "Deshabilitar" : "Habilitar";
            }
        }
    }
}