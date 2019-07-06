<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaArea.aspx.cs" Inherits="SICE.ListaArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 style="text-align:center;">Lista de areas</h2>
            <div class="lista" id="Lista" runat="server">

                
            </div>
        </div>
    </div>


    <script>
        function clicked(id, flujo) {
            flujo = (flujo) ? 0 : 1;
            console.log(flujo);
            //Primero enviamos el cambio a la API
            $.post(`http://www.scristi.ml/api/sice/changeFlujo.php?ID=${id}&flujo=${flujo}`);
            let area = document.getElementById(`list_${id}`);
            if (flujo == 1) {
                area.children[1].innerText = "Encedido";
            }
            else {
                area.children[1].innerText = "Apagado";
            }
            area.children[2].setAttribute('onclick', 'clicked(' + id + ',' + flujo + ')');
            
        }
    </script>
</asp:Content>
