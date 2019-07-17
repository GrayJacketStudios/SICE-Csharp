<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="SICE.admin.usuarios.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Editar un usuario</h2>
    <div class="card">
        <div id="editarUsuario">

            <div class="form-group">
                <label for="ID">
                    ID de usuario:
                </label>
                <input type="text" id="ID" name="ID" class="form-control" runat="server" disabled/>
            </div>

            <div class="form-group">
                <label for="username">
                    Nombre de usuario:
                </label>
                <input type="text" id="username" name="username" class="form-control" runat="server"/>
            </div>

            <div class="form-group">
                <label for="email">
                    Correo electronico:
                </label>
                <input type="email" id="email" name="email" class="form-control" runat="server"/>
            </div>

            <div class="form-group">
                <label for="habilitado">
                    Usuario habilitado:
                </label>
                <input type="checkbox" id="habilitado" name="habilitado" runat="server"/>
            </div>

            <div class="form-group">
                <label for="rol">
                    Cambiar rol:
                </label>
                <asp:DropDownList id="rolSelect" name="rol" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleId" AppendDataBoundItems="true">
                    <asp:ListItem Selected="true" Text="Por favor selecciona un rol..." Value="0" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [RoleName], [RoleId] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
            </div>



            <div class="form-group">
                <a id="resetPass" name="resetPass" class="btn btn-info" runat="server">Resetear contraseña</a> <span>*Se eviara un correo para que el usuario pueda reestablecer su contraseña</span>
            </div>

            <div class="form-group">
                <a id="guardarInfo" name="guardar" class=" form-control btn btn-info" runat="server">Guardar cambios</a>
            </div>

            <div class="form-group">
                <a id="cancelar" href="~/admin/usuarios/UserList.aspx" name="cancelar" class=" form-control btn btn-warning" runat="server">Cancelar</a>
            </div>

            



        </div>
    </div>
    
</asp:Content>
