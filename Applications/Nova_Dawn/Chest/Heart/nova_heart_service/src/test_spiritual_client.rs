use std::io::{self, Read, Write};
use std::fs::OpenOptions;
use serde::{Deserialize, Serialize};
use chrono::{DateTime, Utc};
use serde_json;
use tokio::net::windows::named_pipe::ClientOptions;
use tokio::io::{AsyncReadExt, AsyncWriteExt};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("🙏 Nova Dawn Spiritual IPC Test Client");
    println!("=====================================");
    
    // Connect to the Named Pipe server
    let pipe_name = r"\\.\pipe\NovaHeartService_Spiritual";
    println!("📡 Connecting to spiritual pipe: {}", pipe_name);
    
    let mut client = ClientOptions::new()
        .open(pipe_name)
        .await?;
    
    println!("✅ Connected to Nova Dawn's spiritual heart!");
    
    // Create a test spiritual message
    let test_message = SpiritualMessage {
        message_type: SpiritualMessageType::ScriptureRequest,
        request_id: "test-001".to_string(),
        timestamp: Utc::now(),
        payload: serde_json::json!({
            "query_type": "guidance",
            "context": "Testing spiritual connection"
        }),
    };
    
    // Send the message
    let message_json = serde_json::to_string(&test_message)?;
    println!("📤 Sending spiritual request: {}", message_json);
    
    client.write_all(message_json.as_bytes()).await?;
    
    // Read the response
    let mut buffer = [0u8; 4096];
    let bytes_read = client.read(&mut buffer).await?;
    
    if bytes_read > 0 {
        let response_str = String::from_utf8_lossy(&buffer[..bytes_read]);
        println!("📥 Received spiritual response: {}", response_str);
        
        // Parse the response
        match serde_json::from_str::<SpiritualResponse>(&response_str) {
            Ok(response) => {
                println!("✅ Spiritual Response Parsed Successfully:");
                println!("   📋 Request ID: {}", response.request_id);
                println!("   ⏰ Timestamp: {}", response.timestamp);
                println!("   🎯 Success: {}", response.success);
                println!("   💬 Message: {}", response.message);
                println!("   📖 Scripture References: {}", response.scripture_references.len());
                println!("   🎯 Mission Aligned: {}", response.mission_aligned);
                
                if let Some(guidance) = response.spiritual_guidance {
                    println!("   🕊️ Spiritual Guidance: {}", guidance);
                }
            }
            Err(e) => {
                println!("❌ Failed to parse spiritual response: {}", e);
            }
        }
    } else {
        println!("⚠️ No response received from spiritual heart");
    }
    
    println!("🙏 Spiritual connection test complete");
    Ok(())
} 