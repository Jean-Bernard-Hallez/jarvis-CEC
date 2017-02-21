jv_pg_ct_fonction_CEC_ETAT() {
etatTV=`echo pow 0 | cec-client -s -d 1`
say "Je vais mesurer son état, patientez..."
if [[ "$etatTV" =~ "on" ]]; then
say "La Télévision est alumée"
fi

if [[ "$etatTV" =~ "standby" ]]; then
say "La Télévision est arrêtée"
fi
} 

if [[ "$etatTV" =~ "unknown" ]]; then
say "Je n'arrive pas à communiquer avec la télé, elle doit être arrétée par l'interupteur. "
fi
} 


jv_pg_ct_fonction_CEC_ETEINT() {
cec-client -s -d 1 >/dev/null 2>&1 
say "la télé est éteinte"
}

jv_pg_ct_fonction_CEC_ALLUME() {
say "j'allume la télé"
echo on 0 | cec-client -s -d 1 >/dev/null 2>&1 
}

