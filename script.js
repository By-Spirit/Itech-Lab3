window.onload = () => {
    const dateForm = document.getElementById("first_date");
    dateForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const formDataDate = new FormData(this);

        fetch("db.php", {method: "post", body: formDataDate
        }).then(function (response){ return response.text();
        }).then(function (text) { document.getElementById("text").innerHTML = text;
        }).catch(function (error) { console.error(error);
        });
    })

    const nameForm = document.getElementById("name");

    nameForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const formDataName = new FormData(this);
        fetch("db.php", { method: "post", body: formDataName
        }).then(function (response){ return response.json();
        }).then(function (json) { document.getElementById("text").innerHTML = json;
        }).catch(function (error) { console.error(error);
        });
    })

    const leagueForm = document.getElementById("league");

    leagueForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const formDataDate = new FormData(this);
        var ajax = new XMLHttpRequest();
        ajax.open("POST", "db.php");
        ajax.responseType = 'document';
        ajax.send(formDataDate);

        ajax.onload = () => {
            document.getElementById("text").innerHTML = ajax.responseXML.body.innerHTML;
        }
    })
}