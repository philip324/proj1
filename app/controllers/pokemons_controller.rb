class PokemonsController < ApplicationController
	# Part 2: Implement capturing Pokemon
	def capture
		# Step 1: Grab the id of the Pokemon from the parameters 
		# and set that Pokemon's trainer to be the current trainer logged in.
		# To grab the current trainer, use current_trainer. You can use this in controllers and views.
		# holder = current_trainer
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		# Step 2: Don't forget to save the changes to the Pokemon!!!
		@pokemon.save
		# Step 3: Redirect to the home page
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save # why I cannot use update?
		holder = @pokemon.trainer
		if (@pokemon.health <= 0)
			@pokemon.destroy
		end
		# Redirect to the trainer's profile page at the end of the damage method
		# trainer GET    /trainers/:id(.:format)           trainers#show
		holder = @pokemon.trainer
		redirect_to trainer_path(holder)
	end

	def heal
		# Extra Credit: Healing your Pokemons
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health += 10
		@pokemon.save
		holder = @pokemon.trainer
		redirect_to trainer_path(holder)
	end

	# Part 5 Create your own pokemon
	def new
  		@pokemon = Pokemon.new
  	end

  	def create
  		@pokemon = Pokemon.new(pokemon_params)
  		@pokemon.level = 1
  		@pokemon.health = 100
  		@pokemon.trainer = current_trainer
  		if @pokemon.save
  			redirect_to trainer_path(current_trainer)
  		else
      		flash[:error] = @pokemon.errors.full_messages.to_sentence
  			redirect_to new_pokemon_path
  		end
  	end

  	private
  	def pokemon_params
  		params.require(:pokemon).permit(:name)
  	end

end
