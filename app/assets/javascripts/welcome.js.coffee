$ ->
  $(document).on "click", "a.fizzbuzzlink", (e)->
    e.preventDefault()
    # make remote call to welcome#get_fizzbuzz
    num = $(this).data('number')
    $.ajax(
      url: "/welcome/get_fizzbuzz"
      type: "GET"
      dataType: "json"
      contentType: "application/json"
      data:
        number: num
      success: (data)->
        $(document).find("span[data-number=#{num}]").html "#{data.word}"
      error: ()->
        $(document).find("span[data-number=#{num}]").html "404 (not found)"
    )
