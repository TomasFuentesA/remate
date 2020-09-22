function searchAuction(value) {
    var auctions = $('#auctionrecord_auction_id').val()   
    var url = "/auctions/searchFilterAuction";     
    var formData = "q="+auctions
     $.get(url, formData, function(json) {  
     
        console.log(json)
        jsonToTable(json)
     })
}

function jsonToTable(json) {
    var jsondata = '{"Name":"John Doe","Email":"john@doe.com","Gender":"male"}';

// (B) PARSE JSON INTO OBJECT
var parsed = JSON.parse(json);
console.table(json);

// (C) LOOP THROUGH OBJECT + DRAW TABLE
var theHTML = "<table>";
for (let key in json) {
  theHTML += "<tr>";
  theHTML += "<td>" + key + "</td>";
  theHTML += "<td>" + json[key] + "</td>";
  theHTML += "</tr>";
}
theHTML += "</table>";

// (D) PUT INTO HTML CONTAINER
// Add <div id="tableWrap"></div> to your HTML
$('div#listAuction').html(theHTML);
   }