
# Agda szablon

Plik `homework_tresci.agda` zawiera treści i listę importów.

## Środowisko programistyczne

[Tutorial Agdy](https://agda.readthedocs.io/en/v2.6.0.1/getting-started/) opisuje co najmniej kilka sposobów zainstalowania kompilatora Agdy i wsparcia w edytorze.
W moim doświadczeniu tamte instrukcje nie zawsze działają.

Opcja minimum to sam kompilator i biblioteka standardowa. Oba potencjalnie do znalezienia w repozytoriach popularnych dystrybucji linuksa. Szablon z treściami działa z:

```
Agda version 2.6.4
std-lib version 1.7.3: https://agda.github.io/agda-stdlib/v1.7.3/
```

Jednak duża zaleta interactive theorem provera jest interaktywność. Do tego potrzebne jest wsparcie na poziomie edytora tekstu. Użytkownicy emacsa są w dobrej pozycji bo wsparcie emacsa jest natywne - i poradzą sobie sami.

Pozostałym proponuję jedną z dwóch opcji:

### Nix i Vscode (polecana)

Zainstaluj [nix](https://nixos.org/download/) zgodnie z instrukcją (tj. wywołaj `sh <(curl -L https://nixos.org/nix/install) --daemon`). Włącz potrzebną funkcjonalność dodając linijkę:

```
experimental-features = nix-command flakes
```

do pliku `~/.config/nix/nix.conf` lub `/etc/nix/nix.conf`.

Wykonaj:

```bash
$ nix develop github:zmrocze/agda-devshell#agda-shell
```

Komenda umiejscowi Cię w shellu, w którym dostępne są programy `agda`, `agda-mode` i `als`. Ta komenda może Ci zadać kilka pytań, które dotyczą ustawień cache. Bardzo preferowana jest odpowiedź twierdząca - wtedy zaciągamy instalowane zależności z cache, zamiast budować ze źrodła.

Program `als` razem z wtyczką o nazwie `agda-mode` do Vscode'a zapewnia wsparcie do agdy w edytorze kodu. Uruchom Vscode z tego shella (komendą `code .`). Zobacz [drugie-README](https://github.com/zmrocze/agda-devshell/blob/main/README.md) po wskazówki o tym jak poinstruować to rozszerzenie do zauważenia że biblioteka standardowa jest w scope'ie.

Można skopiować projekt szablonowy komendą: `nix flake init -t github:zmrocze/agda-devshell#agda`.
`Nix`a odinstalujesz tak jak tu napisano: https://nixos.org/manual/nix/stable/installation/uninstall.

### Online

Jest online edytor https://agdapad.quasicoherent.io/, który hostuje emacsa.

Problemy:

 - zdażyło mi się tracić sesję po zwykłym przełączaniu karty i tracić kod
 - nie da się kopiować spoza emacsa
 - nie wiadomo jaka wersja agdy tam działa
