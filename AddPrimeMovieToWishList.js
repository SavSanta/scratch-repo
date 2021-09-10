

function getCookie(cookieName) {
    var name = cookieName + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i].trim();
        if ((c.indexOf(name)) == 0) {
            console.log("found");
            return c.substr(name.length);
        }

    }
    alert("not found");
    return null;
}


async function addtolist(sid, daturi) {
await fetch("https://www.amazon.com/gp/registry/huc/add-item-ajax.html?ie=UTF8", {
    "credentials": "include",
    "headers": {
        "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0",
        "Accept": "text/html,*/*",
        "Accept-Language": "en-US,en;q=0.5",
        "X-Requested-With": "XMLHttpRequest",
        "Content-Type": "application/x-www-form-urlencoded"
    },
    "body": "ASIN=" +daturi+"&rsid="+sid+"&sourceCustomerOrgListID=pop_2TXBZEX2MJ8UH_wishlist&sourceCustomerOrgListItemID=&wlPopCommand=pop_2TXBZEX2MJ8UH_wishlist&session-id="+sid+"&isMerchantExclusive=0&registryID=2TXBZEX2MJ8UH&registryType=wishlist&quantity=1&requestedQty=1&sid="+sid+"&cache=false&url=%2Fgp%2Fregistry%2Fhuc%2Fadd-item-ajax.html%3Fie%3DUTF8&action=add&type=wishlist&inlineLinkWeblabTreatment=undefined&caller=aui&streaming=1&sourceVendorId=website.wishlist.detail.add",
    "method": "POST",
    "mode": "cors"
});

}

sid = setCookie('session-id');
items = [
        "",
        "",
  ];

items.forEach( item => addtolist(sid, item));
