function ex -d "uncompress any archive"
    switch (echo $argv[1] | awk -F . '{if (NF>1) {print tolower($NF)}}')
      case "tar.gz" "tgz"
          tar xzf $argv[1]
      case "br2"
          bunzip2 $argv[1]
      case "tar.bz2" "tbz2"
          tar xjf $argv[1]
      case "tar.xz"
          tar xJf $argv[1]
      case "tar" "tar.xz" "tar.zst"
          tar xf $argv[1]
      case "gz"
          gunzip $argv[1]
      case "Z"
          uncompress $argv[1]
      case "7z"
          7z x $argv[1]
      case "deb"
          ar x $argv[1]
      case "zip"
          unzip $argv[1]
      case "rar"
          unrar x $argv[1]  
      case "*"
          echo $argv[1] "cannot be extracted via ex"
    end
end
