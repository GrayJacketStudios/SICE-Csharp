<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="SICE.admin.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Usuarios</h2>
        <asp:Button ID="Button1" runat="server" Text="Registrar usuario" PostBackUrl="~/Account/Register.aspx" Height="36px" Width="181px" CssClass="btn btn-default"/>
        <br/>

                   <div id="LArCon" class="card-body scroll" style="max-height: 550px!important;">
                        <table class="table table-hover" id="tablaConsumo">
                            <tr>

                                <th scope="col">Nombre</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Opción</th>
                            </tr>
                            <asp:ListView  ID="ListView1" runat="server" DataSourceID="SqlInfo">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="HabilitadoLabel" runat="server" Text='<%# ((Eval("Habilitado").ToString() == "1")?"Activo":"Deshabilitado") %>' />
                                        </td>
                                        <td>
                                            <a runat="server" href='<%#String.Concat("~/admin/usuarios/UserEdit?Id=",(Eval("Id").ToString())) %>' class="btn btn-primary btn-sm">Editar</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                             
                            </asp:ListView >
                            </table>
                       <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListView1" PageSize="5">
                            <Fields>
                                <asp:NumericPagerField ButtonType="Link" />
                            </Fields>
                        </asp:DataPager>

               </div>
    <br/>
        <asp:SqlDataSource ID="SqlInfo" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Email],[UserName],[Habilitado],[Id] FROM [AspNetUsers]"></asp:SqlDataSource>

</asp:Content>
