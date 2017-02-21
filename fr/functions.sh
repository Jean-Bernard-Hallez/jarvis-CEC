jv_pg_ct_fonction_CEC_ETAT() {
say "Je vais mesurer son état, patientez..."
etatTV=`echo pow 0 | cec-client -s -d 1`

if [[ "$etatTV" =~ ": on" ]]; then
say "La Télévision est alumée"
fi

if [[ "$etatTV" =~ ": standby" ]]; then
say "La Télévision est arrêtée"
fi

if [[ "$etatTV" =~ ": unknown" ]]; then
say "Je n'arrive pas à communiquer avec la télé, elle doit être arrétée par l'interupteur. "
# say "Je n'arrive pas à communiquer avec la télé, Désolé je ne connais pas son état"
fi
} 


jv_pg_ct_fonction_CEC_ETEINT() {
echo standby 0 | cec-client -s -d 1 >/dev/null
say "la télé est éteinte"
sleep 2
fonction_CEC_vérif_OFF
}

jv_pg_ct_fonction_CEC_ALLUME() {
say "j'allume la télé"
echo on 0 | cec-client -s -d 1 >/dev/null
sleep 2
fonction_CEC_vérif_ON
}

jv_pg_ct_fonction_CEC_SOURCE() {
say "je bascule la télé sur la CEC active"
echo 'as'|cec-client –s >/dev/null
}

fonction_CEC_vérif_OFF() {
etatTV=`echo pow 0 | cec-client -s -d 1`
if [[ "$etatTV" =~ ": on" ]]; then
say "La Télévision est encore allumée, il y a du avoir un bug, je reforce son arrêt"
echo standby 0 | cec-client -s -d 1 >/dev/null
fi

}

fonction_CEC_vérif_ON() {
etatTV=`echo pow 0 | cec-client -s -d 1`
if [[ "$etatTV" =~ ": standby" ]]; then
say "La Télévision est pas encore éclairée, il y a du avoir un bug je reforce sa mise en marche"
echo on 0 | cec-client -s -d 1 >/dev/null
fi
}
