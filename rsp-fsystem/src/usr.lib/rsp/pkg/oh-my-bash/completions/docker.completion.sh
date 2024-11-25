#! bash oh-my-bash.module

function _omb_completion_docker_has_completion {
  local complete
  complete=$(complete -p docker 2>/dev/null) && [[ $complete ]] || return 1

  # bash-completion runs $(docker completion bash) as a fallback, but the
  # official docker completion is not provided through $(docker completion
  # bash), which is automatically generated by cobra's bash completion V2.  In
  # this case, we can instead use the completion file bundled with OMB.
  if [[ $complete == *__start_docker* ]]; then
    complete -r docker
    return 1
  fi

  unset -f _omb_completion_docker_has_completion
  unset -f _omb_completion_docker_try
  return 0
}

function _omb_completion_docker_try {
  if [[ -s $1 ]]; then
    source "$1"
    _omb_completion_docker_has_completion && return 0
  elif [[ -s $1.sh ]]; then
    source "$1.sh"
    _omb_completion_docker_has_completion && return 0
  elif [[ -s $1.bash ]]; then
    source "$1.bash"
    _omb_completion_docker_has_completion && return 0
  fi
  return 1
}

_omb_completion_docker_has_completion && return 0

if _omb_util_function_exists _comp_load; then
  # bash-completion 2.12
  _comp_load -- docker-compose
  _omb_completion_docker_has_completion && return 0
elif _omb_util_function_exists __load_completion; then
  # bash-completion <= 2.11
  __load_completion docker-compose
  _omb_completion_docker_has_completion && return 0
fi

_omb_completion_docker_try /usr/share/bash-completion/completions/docker && return 0
_omb_completion_docker_try /etc/bash_completion.d/docker && return 0

unset -f _omb_completion_docker_has_completion
unset -f _omb_completion_docker_try
source "$OSH/completions/fallback/docker.bash"