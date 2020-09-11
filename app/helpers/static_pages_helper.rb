module StaticPagesHelper
        

      def get_random_verse
        bible_verses = [
            {
                content: "I can do everything through him who gives me strength.",
                location: "Philippians 4:13"
            },
            {
                content: "Do not be anxious about anything, but in everything, by prayer and petition, with thanksgiving, present your requests to God.",
                location: "Philippians 4:6"
            },
            {
                content: "Be on your guard; stand firm in the faith; be courageous; be strong." ,
                location: "1 Corinthians 16:13"
            },
            {
                content: "Therefore I tell you, whatever you ask in prayer, believe that you have received it, and it will be yours.",
                location: "Mark 11:24"
            },
            {
                content: "Let all that you do be done in love.",
                location: "1 Corinthians 16:14"
            },
            {
                content: "For we walk by faith, not by sight.",
                location: "2 Corinthians 5:7"
            },
            {
                content: "For I know the plans I have for you, declares the Lord, plans for welfare and not for evil, to give you a future and a hope." ,
                location: "Jeremiah 29:11"
            },
            {
                content: "Each one must give as he has decided in his heart, not reluctantly or under compulsion, for God loves a cheerful giver.",
                location: "2 Corinthians 9:7 | ESV"
            },
            {
                content: "And this is the confidence that we have toward him, that if we ask anything according to his will he hears us.",
                location: "1 John 5:14"
            }
        ]

        arr_length = bible_verses.length
        random_number = rand(arr_length)
        return bible_verses[random_number]
      end
end
