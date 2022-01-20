mod processes;
mod services;

use processes::debank_process::debank_process;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    debank_process().await?;
    Ok(())
}
