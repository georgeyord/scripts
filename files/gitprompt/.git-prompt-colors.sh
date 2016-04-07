#!/bin/bash

# This is the custom theme template for gitprompt.sh

override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  GIT_PROMPT_STAGED="${Yellow}●"
  GIT_PROMPT_STASHED="${BoldMagenta}⚑ "
  GIT_PROMPT_CLEAN="${Green}✔"
  
  #GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${USER}@${Yellow}${PathShort}${ResetColor}"
  GIT_PROMPT_START_USER="${Blue}[${USER}] _LAST_COMMAND_INDICATOR_ ${Yellow}${PathShort}${ResetColor}"
  #GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ ${USER}@${GIT_PROMPT_START_USER}"

  #GIT_PROMPT_END_USER=" \n${USER}@${HOSTNAME%%.*}$"
  GIT_PROMPT_END_USER="${Blue}$ ${ResetColor}"
  GIT_PROMPT_END_ROOT="${GIT_PROMPT_END_USER}"
}

reload_git_prompt_colors "Custom"
