# Q0: Why is this error being thrown?
    There is no controller for the Pokemon model.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
    On the HomeController, trainerless_pokemon is set to a list of Pokemon in the model without trainers (i.e. the trainer_id field is nil) using .where query. Then @pokemon is set to a random Pokemon in that list using the .sample method.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
    It creates a button that calls the capture method for Pokemon.
    The "capture_path(id: @pokemon)" directs us to the capture path when we click the button. The capture path is then defined in the routes.rb, which takes in the pokemon's id and goes into pokemons#capture'.

# Question 3: What would you name your own Pokemon?
    Nomekop.

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
    redirect_to @pokemon.trainer
    It needs the pokemon's current trainer.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
    If the pokemon's name is not present or is not unique, the pokemons_controller will save the error message and redirect to the new.html.erb page. This view has access to the flash error and could display it if error exists.

# Give us feedback on the project and decal below!
    I love this project!

# Extra credit: Link your Heroku deployed app
