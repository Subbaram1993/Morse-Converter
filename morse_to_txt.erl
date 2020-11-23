-module(morse_to_txt).
-compile(export_all).

get_code_for_words(Sentence) ->
    Words = string:split(Sentence, "\s", all),
    LettersWords =
        #{"a" => ".-","b" =>"-...","c" =>"-.-.","d" => "-..","e" => ".","f" => "..-.","g" => "--.","h" =>"....","i" =>"..","j" =>".---","k" =>"-.-","l" =>".-..","m" =>"--","n" =>"-.","o" => "---","p" =>".--.","q" =>"--.-","r" =>".-.","s" =>"...","t" =>"-","u" =>"..-","v" =>"...-","w" =>".--","x" =>"-..-","y" =>"-.--","z" =>"--..","1" => ".----","2" => "..---","3" => "...--","4" => "....-","5" => ".....","6" => "-....","7" => "--...","8" => "---..","9" => "----.","0" => "-----","." => ".-.-.-" ,"," => "--..--" ,";" =>"---..." ,"?" =>"..--..","'" => ".----.","-" => "-....-","/" =>"-..-.","(" =>"-.--.-",")" =>"-.--.-","\"" =>".-..-."," " => "......."},
    Result = get_codes(Words, LettersWords, _AllCodes = []),
    io:format("~s~n", [Result]).

get_codes([Word | Words], Map, AllCodes) ->
    NewAllCodes =
        maps:fold(fun(K, V, Acc) ->
                     case V =:= Word of
                         true -> [K | Acc];
                         _ -> Acc
                     end
                  end,
                  AllCodes,
                  Map),
    get_codes(Words, Map, NewAllCodes);
get_codes([], _Map, AllCodes) ->
    lists:reverse(AllCodes).
