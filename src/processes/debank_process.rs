use futures::future;

use crate::services::get_debank_balance_service::get_debank_balance_service;

pub async fn debank_process() -> Result<(), Box<dyn std::error::Error>> {
    let wallets = ["0x84D34f4f83a87596Cd3FB6887cFf8F17Bf5A7B83"];

    let wallet_balances = future::try_join_all(
        wallets
            .into_iter()
            .map(|wallet| get_debank_balance_service(wallet.into())),
    )
    .await?;

    for wallet_balance in wallet_balances {
        if let Some(wb) = wallet_balance {
            for balance in wb.chain_list {
                println!("{:?}", balance);
            }
        }
    }

    Ok(())
}
