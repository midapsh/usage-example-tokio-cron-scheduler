
sudo systemctl enable "/opt/how-to-tokio-cron-scheduler/services/debank-extractor.service"
sudo systemctl daemon-reload
sudo systemctl start debank-extractor


sudo systemctl status debank-extractor
sudo systemctl stop debank-extractor


journalctl -u debank-extractor


chmod a+x /opt/how-to-tokio-cron-scheduler/entrypoints/debank_extractor_entrypoint.sh



sudo heaptrack target/release/debank_extractor
heaptrack_gui "heaptrack.debank_extractor.76992.gz"

####

valgrind \
    --leak-check=full \
    --show-leak-kinds=all \
    target/release/debank_extractor

####

sudo heaptrack target/release/debank_extractor
heaptrack_gui "heaptrack.debank_extractor.60314.gz"

####

RUSTFLAGS="-Z sanitizer=memory" cargo run --target x86_64-unknown-linux-gnu

