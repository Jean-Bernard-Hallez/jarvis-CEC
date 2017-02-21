jv_pg_ct_fonction_CEC_ETAT() {
etatTV=`echo pow 0 | cec-client -s -d 1`
say "Je vais mesurer son état, patientez..."
if [[ "$etatTV" =~ "on" ]]; then
say "La Télvision est en alumée"
fi

if [[ "$etatTV" =~ "standby" ]]; then
say "La Télvision est arrêtée"
fi

} 
