from django.http import HttpResponse, HttpRequest
from django.shortcuts import render
#view -> templates/index.html
def index(request: HttpRequest) -> HttpResponse:
    return render(request, "index.html")

#view -> templates/about.html
def about(request: HttpRequest) -> HttpResponse:
    maps_link: str = "https://www.google.com/maps/@-8.1374557,-41.1453689,3a,75y,135.26h,90t/data=!3m7!1e1!3m5!1sCLtrMcUIWY6qUqxq_PBMMw!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D0%26panoid%3DCLtrMcUIWY6qUqxq_PBMMw%26yaw%3D135.26094!7i16384!8i8192?entry=ttu&g_ep=EgoyMDI1MTExMS4wIKXMDSoASAFQAw%3D%3D"
    return render(request, "about.html", {"maps_link": maps_link})

#view -> templates/login.htmk
def login(request: HttpRequest) -> HttpResponse:
    return render(request, "login.html")
