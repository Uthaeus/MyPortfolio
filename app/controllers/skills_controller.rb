class SkillsController < ApplicationController
  
    def index
      @skills = Skill.all
    end
  
    def new
      @skill = Skill.new
    end
  
    def create
      @skill = Skill.new(skill_params)
  
      respond_to do |format|
        if @skill.save
          format.html { redirect_to skills_path, notice: "Skill was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    def show
      @skill = Skill.find(params[:id])
      
    end
  
    def destroy
      @skill = Skill.find(params[:id])
      @skill.destroy
  
      respond_to do |format|
        format.html { redirect_to skills_path, notice: "Skill was successfully destroyed." }
      end
    end
  
    private
  
    def skill_params
      params.require(:skill).permit(:title, :percent_utilized)
    end
  end