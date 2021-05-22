#!/bin/ash -eu

usage() {
  cat <<-EOS 1>&2
	Usage: ${0} -m smtp://[<USER>:<PASSWORD>@]<HOST>:<PORT> [-a {none|plain|login|cram-md5|gssapi}] [-t] -f <FROM> -s <SUBJECT> -b <BODY> <TO> ...
	
	Send mail
	
	 -a SMTP-AUTH method
	 -t enable StartTLS
	EOS
}

while getopts 'a:b:f:m:s:th' 'OPT'; do
  case "${OPT}" in
    'a')
      SMTP_AUTH="${OPTARG}"
      ;;
    'b')
      BODY="${OPTARG}"
      ;;
    'f')
      FROM="${OPTARG}"
      ;;
    'm')
      MTA="${OPTARG}"
      ;;
    's')
      SUBJECT="${OPTARG}"
      ;;
    't')
      STARTTLS=1
      ;;
    *)
      usage

      exit 1
      ;;
  esac
done

shift $(( ${OPTIND} - 1 ))

echo "${BODY}" \
  | mail \
      -s "${SUBJECT}" \
      -r "${FROM}" \
      -S v15-compat \
      -S smtp-auth="${SMTP_AUTH:-none}" \
      -S mta="${MTA}" ${STARTTLS:+-S smtp-use-starttls} \
        "$@"

