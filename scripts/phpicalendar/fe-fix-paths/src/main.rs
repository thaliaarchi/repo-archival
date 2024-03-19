use std::{
    env::args_os,
    fs::File,
    io::{stdout, Read, Write},
};

use regex::bytes::Regex;

/// Fixes `fatal: Empty path component found in input`
/// found from
///
/// ```sh
/// rsync -ai a.cvs.sourceforge.net::cvsroot/phpicalendar/ phpicalendar.cvs
/// cd phpicalendar.cvs
/// find . -name '*,v' | cvs-fast-export > ../phpicalendar.fe
/// cd ..
/// git init phpicalendar.git
/// cd phpicalendar.git
/// git fast-import < ../phpicalendar.fe
/// ```
fn main() {
    let path = args_os().skip(1).next().unwrap();
    let mut buf = Vec::new();
    File::open(path).unwrap().read_to_end(&mut buf).unwrap();

    let re = Regex::new(r"(\nM \d{6} (:\d+|inline) )/").unwrap();
    let replaced = re.replace_all(&buf, b"$1");
    stdout().write_all(&replaced).unwrap();
}
