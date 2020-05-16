import {dataTable} from "./dataTables.js";

window.onload = initialize;

let loadJumbo = () => {
    return `
    <div class="card card-image" id="bg-img">
        <div class="text-white text-center rgba-stylish-strong py-5 px-4">
            <div class="py-5">
                <!-- Content -->
                <h5 class="h5"><img id="logo" src="../static/img/logo.png"/></h5>
                <a class="btn purple-gradient" href="https://tidal.com/browse/artist/9314580">Tidal</a>
                <a class="btn peach-gradient" href="https://github.com/Nxssie/NxssieXQuery"><i class="fas fa-clone left"></i> View project</a>
                <a class="btn aqua-gradient" href="https://open.spotify.com/artist/6p9nrPaCQXasjQbaMZ2gv8"><i class="fab fa-spotify left"></i> Spotify</a>
            </div>
        </div>
    </div>
    `
}

let goBack = () => {
    window.history.back();
    console.log("hello");
}

function initialize() {
    document.getElementById("jumbo").innerHTML = loadJumbo();
    if(document.getElementById("return-button")){
        document.getElementById("return-button").addEventListener("click", goBack());
    }
    dataTable();
}


