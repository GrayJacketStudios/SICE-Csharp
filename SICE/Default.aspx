<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SICE._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

         <!-- Modal content -->
<div class="modal-content" id="modalForMap">
  <div class="modal-header">
    <span id="close" class="close" onclick="hideModal();">&times;</span>
    <h2>Area </h2>
  </div>
  <div class="modal-body">
  </div>
</div> 

    <div class="row">
        <div class="col-md-12">
            <center><h2>Mapa de areas</h2></center>

                <p id="Ptest" runat="server"/>
            
            <div class="mapa" id="MapaDiv" runat="server">

            </div>


        </div>
        
    </div>




</asp:Content>
