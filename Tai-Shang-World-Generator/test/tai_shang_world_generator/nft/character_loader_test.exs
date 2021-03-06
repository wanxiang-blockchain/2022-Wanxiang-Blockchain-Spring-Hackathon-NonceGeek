defmodule TaiShangWorldGenerator.CharacterLoaderTest do
  alias TaiShangWorldGenerator.Nft.CharacterLoader
  use ExUnit.Case

  test "get_badges_list" do
    image_parsed="<svg xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMinYMin meet\" viewBox=\"0 0 350
    350\"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width=\"100%\" height=\"100%\"
     fill=\"black\" /><text x=\"10\" y=\"20\" class=\"base\">
     Badges: </text><text x=\"10\" y=\"40\" class=\"base\">
     [\"noncegeeker\"]</text><text x=\"10\" y=\"60\" class=\"base\">
     See NFT rendered in: </text><text x=\"10\" y=\"80\" class=\"base\">
     https://web3dev.nft.doge.university?token_id=1</text><text x=\"10\" y=\"100\" class=\"base\">
     5</text><text x=\"10\" y=\"120\" class=\"base\">
     4</text><text x=\"10\" y=\"140\" class=\"base\">
     7</text><text x=\"10\" y=\"160\" class=\"base\">
     3</text><text x=\"10\" y=\"180\" class=\"base\">
     9</text><text x=\"10\" y=\"200\" class=\"base\">
     8</text><text x=\"10\" y=\"220\" class=\"base\">
     </text></svg>"
    assert CharacterLoader.get_badges_list(image_parsed) == ["noncegeeker"]
    ## trim whitespaces and \n
    image_parsed="<svg xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMinYMin meet\" viewBox=\"0 0 350
    350\"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width=\"100%\" height=\"100%\"
     fill=\"black\" /><text x=\"10\" y=\"20\" class=\"base\">
     Badges: </text><text x=\"10\" y=\"40\" class=\"base\">
        [\"noncegeeker\",1]   </text><text x=\"10\" y=\"60\" class=\"base\">
     See NFT rendered in: </text><text x=\"10\" y=\"80\" class=\"base\">
     https://web3dev.nft.doge.university?token_id=1</text><text x=\"10\" y=\"100\" class=\"base\">
     5</text><text x=\"10\" y=\"120\" class=\"base\">
     4</text><text x=\"10\" y=\"140\" class=\"base\">
     7</text><text x=\"10\" y=\"160\" class=\"base\">
     3</text><text x=\"10\" y=\"180\" class=\"base\">
     9</text><text x=\"10\" y=\"200\" class=\"base\">
     8</text><text x=\"10\" y=\"220\" class=\"base\">
     </text></svg>"
    assert CharacterLoader.get_badges_list(image_parsed) == ["noncegeeker",1]
    ## Only match after Badges:
    image_parsed="<svg xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMinYMin meet\" viewBox=\"0 0 350
    350\"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width=\"100%\" height=\"100%\"
     fill=\"black\" /><text x=\"10\" y=\"20\" class=\"base\">
     [\"noncegeeker\",1]</text><text x=\"10\" y=\"60\" class=\"base\">
     Badges: </text><text x=\"10\" y=\"40\" class=\"base\">
     [\"noncegeeker\",2]</text><text x=\"10\" y=\"60\" class=\"base\">
     See NFT rendered in: </text><text x=\"10\" y=\"80\" class=\"base\">
     https://web3dev.nft.doge.university?token_id=1</text><text x=\"10\" y=\"100\" class=\"base\">
     [\"noncegeeker\",3]</text><text x=\"10\" y=\"60\" class=\"base\">
     5</text><text x=\"10\" y=\"120\" class=\"base\">
     4</text><text x=\"10\" y=\"140\" class=\"base\">
     7</text><text x=\"10\" y=\"160\" class=\"base\">
     3</text><text x=\"10\" y=\"180\" class=\"base\">
     9</text><text x=\"10\" y=\"200\" class=\"base\">
     8</text><text x=\"10\" y=\"220\" class=\"base\">
     </text></svg>"
    assert CharacterLoader.get_badges_list(image_parsed) == ["noncegeeker",2]
    ## badges is null
    image_parsed="<svg xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMinYMin meet\" viewBox=\"0 0 350
    350\"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width=\"100%\" height=\"100%\"
     fill=\"black\" /><text x=\"10\" y=\"20\" class=\"base\">
     </text><text x=\"10\" y=\"60\" class=\"base\">
     Badges: </text><text x=\"10\" y=\"40\" class=\"base\">
    </text><text x=\"10\" y=\"60\" class=\"base\">
     See NFT rendered in: </text><text x=\"10\" y=\"80\" class=\"base\">
     https://web3dev.nft.doge.university?token_id=1</text><text x=\"10\" y=\"100\" class=\"base\">
     [\"noncegeeker\",3]</text><text x=\"10\" y=\"60\" class=\"base\">
     5</text><text x=\"10\" y=\"120\" class=\"base\">
     4</text><text x=\"10\" y=\"140\" class=\"base\">
     7</text><text x=\"10\" y=\"160\" class=\"base\">
     3</text><text x=\"10\" y=\"180\" class=\"base\">
     9</text><text x=\"10\" y=\"200\" class=\"base\">
     8</text><text x=\"10\" y=\"220\" class=\"base\">
     </text></svg>"
    assert CharacterLoader.get_badges_list(image_parsed) == []
  end
end
