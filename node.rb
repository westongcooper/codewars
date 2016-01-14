class Node
  attr_accessor :next
end

def loop_size(node)
  size = 0
  slow = node
  fast = node.next
  while slow != fast
    slow = slow.next
    fast = fast.next.next
  end
  size += 1
  slow = slow.next
  while slow != fast
    size += 1;
    slow = slow.next
  end
  size
end