use std::fs::File;
use std::io::prelude::*;
#[macro_use]
extern crate serde_json;

fn main() {
    let mut id = 0;
    loop {
        id += 1;
        if id < 2001 {
            let file_path = format!("./assets/metadata/{}", id);
            let mut file = File::create(file_path).expect("Error encountered while creating file!");
            let dynamic_image  = format!("https://cryptotesters.mypinata.cloud/ipfs/QmdwSvMaprFBQ7EjdiJ67GYVFgr6q18W4u2pK6f65BqnCh/{}.png", id);
            let dynamic_name = format!("Tester{}", id);
            let content =
                json!({"description":"Cryptotesters","image": dynamic_image,"name": dynamic_name});

            file.write_all(serde_json::to_string_pretty(&content).unwrap().as_bytes())
                .expect("Error while writing to file");

            continue;
        }
        break;
    }
}
