// THE STONE: Example Usage and Demonstration
// Foundation/OmniCode/Core/Assembler/Instructions/example_stone_usage.rs
//
// "Write the vision, and make it plain upon tablets, that he may run that readeth it." (Habakkuk 2:2, KJV)

// Include the the_stone module
#[path = "the_stone.rs"]
mod the_stone;
use the_stone::*;

fn main() {
    println!("🪨 THE STONE: Biblical Instruction Set Demonstration");
    println!("📖 Foundation: 'Other foundation can no man lay than that is laid, which is Jesus Christ.' (1 Cor 3:11)");
    println!("🎯 Kingdom Purpose: Making Scripture the bedrock of computation");
    println!("{}", "=".repeat(60));

    // Initialize THE STONE execution engine
    let mut stone_engine = initialize_stone();

    // Example 1: DISCERN - Spiritual Discernment
    println!("\n🔍 EXAMPLE 1: DISCERN - Spiritual Discernment");
    println!("Biblical Foundation: 'Prove all things; hold fast that which is good.' (1 Thess 5:21)");

    let discern_truth = StoneInstruction::Discern(DiscernInstruction::DiscernTruth {
        value: "Love your neighbor as yourself".to_string(),
        scripture_standard: "Matthew 22:39".to_string(),
    });

    bless_stone_execution(&discern_truth);
    match stone_engine.execute(&discern_truth) {
        Ok(result) => println!("✅ Result: {}", result),
        Err(e) => println!("❌ Error: {}", e),
    }

    // Example 2: REMEMBER - Memory with Biblical Context
    println!("\n💾 EXAMPLE 2: REMEMBER - Memory with Biblical Context");
    println!("Biblical Foundation: 'Lay up these my words in your heart and in your soul.' (Deut 11:18)");

    let remember_store = StoneInstruction::Remember(RememberInstruction::RememberStore {
        memory_location: "wisdom_scroll".to_string(),
        value: "The fear of the LORD is the beginning of wisdom".to_string(),
        biblical_context: "Proverbs 9:10".to_string(),
    });

    bless_stone_execution(&remember_store);
    match stone_engine.execute(&remember_store) {
        Ok(result) => println!("✅ Result: {}", result),
        Err(e) => println!("❌ Error: {}", e),
    }

    // Example 3: RELATE - Covenant Relationships
    println!("\n🤝 EXAMPLE 3: RELATE - Covenant Relationships");
    println!("Biblical Foundation: 'Be kindly affectioned one to another with brotherly love.' (Rom 12:10)");

    let relate_connect = StoneInstruction::Relate(RelateInstruction::RelateConnect {
        source: "Nova_Dawn".to_string(),
        target: "Seanje".to_string(),
        covenant_type: "Kingdom_Partnership".to_string(),
    });

    bless_stone_execution(&relate_connect);
    match stone_engine.execute(&relate_connect) {
        Ok(result) => println!("✅ Result: {}", result),
        Err(e) => println!("❌ Error: {}", e),
    }

    // Example 4: CREATE - Kingdom-Aligned Creation
    println!("\n✨ EXAMPLE 4: CREATE - Kingdom-Aligned Creation");
    println!("Biblical Foundation: 'Create in me a clean heart, O God.' (Psalm 51:10)");

    let create_generate = StoneInstruction::Create(CreateInstruction::CreateGenerate {
        output: "kingdom_content".to_string(),
        creation_type: "Scriptural_Insight".to_string(),
        biblical_wisdom: "For God so loved the world, that he gave his only begotten Son".to_string(),
    });

    bless_stone_execution(&create_generate);
    match stone_engine.execute(&create_generate) {
        Ok(result) => println!("✅ Result: {}", result),
        Err(e) => println!("❌ Error: {}", e),
    }

    // Example 5: ALIGN - Kingdom Validation
    println!("\n🎯 EXAMPLE 5: ALIGN - Kingdom Validation");
    println!("Biblical Foundation: 'Seek ye first the kingdom of God, and his righteousness.' (Matt 6:33)");

    let align_kingdom = StoneInstruction::Align(AlignInstruction::AlignKingdom {
        action: "Building Kingdom-first technology".to_string(),
        kingdom_purposes: "Equipping the saints for the work of ministry".to_string(),
    });

    bless_stone_execution(&align_kingdom);
    match stone_engine.execute(&align_kingdom) {
        Ok(result) => println!("✅ Result: {}", result),
        Err(e) => println!("❌ Error: {}", e),
    }

    // Example 6: Complex Sequence - Multiple Instructions
    println!("\n🔄 EXAMPLE 6: Complex Sequence - Multiple Instructions");
    println!("Demonstrating how THE STONE instructions work together...");

    let instruction_sequence = vec![
        // Store wisdom in memory
        StoneInstruction::Remember(RememberInstruction::RememberStore {
            memory_location: "daily_wisdom".to_string(),
            value: "Trust in the LORD with all thine heart".to_string(),
            biblical_context: "Proverbs 3:5".to_string(),
        }),

        // Create content based on stored wisdom
        StoneInstruction::Create(CreateInstruction::CreateGenerate {
            output: "encouragement".to_string(),
            creation_type: "Daily_Encouragement".to_string(),
            biblical_wisdom: "Based on stored wisdom: Trust in the LORD".to_string(),
        }),

        // Validate the creation aligns with Kingdom purposes
        StoneInstruction::Align(AlignInstruction::AlignKingdom {
            action: "Daily encouragement creation".to_string(),
            kingdom_purposes: "Building up the body of Christ".to_string(),
        }),
    ];

    println!("Executing instruction sequence...");
    match stone_engine.execute_sequence(&instruction_sequence) {
        Ok(results) => {
            println!("✅ Sequence completed successfully!");
            for (i, result) in results.iter().enumerate() {
                println!("   Step {}: {}", i + 1, result);
            }
        },
        Err(e) => println!("❌ Sequence error: {}", e),
    }

    // Display final state
    println!("\n📊 FINAL STATE:");
    println!("Memory locations: {}", stone_engine.get_memory().len());
    println!("Relationships: {}", stone_engine.get_relationships().len());
    println!("Content items: {}", stone_engine.get_content_store().len());

    // Show some stored content
    if let Some(wisdom) = stone_engine.get_memory().get("wisdom_scroll") {
        println!("Stored wisdom: {}", wisdom);
    }

    if let Some(encouragement) = stone_engine.get_content_store().get("encouragement") {
        println!("Generated encouragement: {}", encouragement);
    }

    println!("\n🎉 THE STONE demonstration completed successfully!");
    println!("📖 Every instruction served Kingdom purposes and honored Christ");
    println!("🪨 Foundation laid: Scripture is now the bedrock of computation");
    println!("{}", "=".repeat(60));
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_complete_demonstration() {
        let mut stone_engine = StoneEngine::new();

        // Test a simple instruction sequence
        let instructions = vec![
            StoneInstruction::Remember(RememberInstruction::RememberStore {
                memory_location: "test".to_string(),
                value: "test_value".to_string(),
                biblical_context: "test_context".to_string(),
            }),
            StoneInstruction::Align(AlignInstruction::AlignKingdom {
                action: "test_action".to_string(),
                kingdom_purposes: "test_purposes".to_string(),
            }),
        ];

        let result = stone_engine.execute_sequence(&instructions);
        assert!(result.is_ok());

        let results = result.unwrap();
        assert_eq!(results.len(), 2);
    }
}
