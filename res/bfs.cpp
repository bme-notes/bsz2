struct Csucs {
	int tavolsagSCsucstol;        // t(v)
	Csucs& elozolegBejartCsucs;   // m(v)
};

Csucs& bejartCsucsokRendre[int&]; // b(i)
int eddigBejartCsucsokSzama;      // j
int bazisCsucsSorszama;	          // k - "Báziscsúcs": innen derítjük fel a többit.

Csucs s, a, b, c, d, e, f, g;

// Inicializalas innentol:

// Kijelöljük s-t, mint báziscsúcsot és felderítjük saját magát:
bazisCsucsSorszama = 1; 
s.tavolsagSCsucstol = 0;

// Bejárjuk az elsöö csúcsot és felvesszük a listára
bejartCsucsokRendre[0] = s;
eddigBejartCsucsokSzama = 1;


do {
    while(bejartCsucsokRendre[bazisCsucsSorszama].koviBejarando != NULL) {
        // Rövidítés
        Csucs& koviBejarando = bejartCsucsokRendre[bazisCsucsSorszama].koviBejarando;
        
        // A bejárt csúcsok listájára felvesszük a következöö alanyt:
        eddigBejartCsucsokSzama++;
        bejartCsucsokRendre[eddigBejartCsucsokSzama] = koviBejarando;

        // A jelenleg bejárt csúcs eggyel távolabb van, mint a bázis.
        // Ezt regisztráljuk:
        koviBejarando.tavolsagSCsucstol = bejartCsucsokRendre[bazisCsucsSorszama].tavolsagSCsucstol+1;
        koviBejarando.elozolegBejartCsucs = bejartCsucsokRendre[bazisCsucsSorszama];
    }

    // Minden csúcs volt már báziscsúcs?
    // Mindenhonnan végeztünk már felderítést?
    if(eddigBejartCsucsokSzama == bazisCsucsSorszama) {
        return;
    } else { 
        bazisCsucsSorszama++;
    } 
 }
