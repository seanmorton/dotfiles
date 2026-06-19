# See https://gist.github.com/huksley/564be2c903312bcee7dffe415d128f90?permalink_comment_id=5389334
# run with crontab: */3 * * * * /Users/seanmorton/scripts/kill-mediaanalysisd-etc.sh > /dev/null 2>&1
#
# Adapted from: https://github.com/aselvan/scripts/blob/master/macos/macos.sh
# Note: these items in the kill list are resource hogs that we can't get rid of w/ out
# doing risky things like deleting or moving files in root '/' partition to
# get rid of the corresponding launchctl plist files. The only thing you can
# do is kill these hogs every few minutes w/ cron job.
kill_list="mediaanalysisd mediaanalysisd-access photoanalysisd photolibraryd cloudphotod Stocks StocksKitService StocksWidget StocksDetailIntents com.apple.Photos.Migration siriactionsd sirittsd ShortcutsViewService contactsd"

echo "Kill list: $kill_list"
for pname in $kill_list ; do
  # kill using killall as there is a chance multiple processes running by same name
  killall -SIGKILL $pname 2>/dev/null
  if [ $? -eq 0 ] ; then
    echo "  $pname: Killed successfully"
  else
    echo "  $pname: Not running" $grey
  fi
done
