//This only assumes that the mob has a body and face with at least one mouth.
//Things like airguitar can be done without arms, and the flap thing makes so little sense it's a keeper.
//Intended to be called by a higher up emote proc if the requested emote isn't in the custom emotes.

/mob/living/emote(var/act, var/m_type=1, var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	switch(act)//Hello, how would you like to order? Alphabetically!
		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> ����� ������ �����&#255;�� � ������!"
				m_type = 2

		if ("blush")
			message = "<B>[src]</B> ��������."
			m_type = 1

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null
				if (param)
					message = "<B>[src]</B> ����&#255;���&#255; [param]."
				else
					message = "<B>[src]</B> ����&#255;���&#255;."
			m_type = 1

		if ("burp")
			message = "<B>[src]</B> ����������."
			m_type = 2

		if ("choke")
			message = "<B>[src]</B> ���������&#255;."
			m_type = 2

		if ("chuckle")
			message = "<B>[src]</B> �����������&#255;."
			m_type = 2

		if ("collapse")
			Paralyse(2)
			message = "<B>[src]</B> �������� ������!"
			m_type = 2

		if ("cough")
			message = "<B>[src]</B> ����&#255;��."
			m_type = 2

		if ("dance")
			if (!src.restrained())
				message = "<B>[src]</B> �������� ��������������."
				m_type = 1

		if ("deathgasp")
			message = "<B>[src]</B> ����������&#255; � ��������� ���, ������������ ����&#255;� ���������..."
			m_type = 1

		if ("drool")
			message = "<B>[src]</B> ������� �����."
			m_type = 1

		if ("faint")
			message = "<B>[src]</B> ��������."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "<B>[src]</B> ����� ������ �����&#255;��."
				m_type = 2

		if ("flip")
			if (!src.restrained() || !src.resting || !src.sleeping)
				src.SpinAnimation(7,1)
				m_type = 2

		if ("frown")
			message = "<B>[src]</B> �������&#255;."
			m_type = 1

		if ("gasp")
			message = "<B>[src]</B> ���������&#255;!"
			m_type = 2

		if ("giggle")
			message = "<B>[src]</B> ��������."
			m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> ������� �� [param]."
			else
				message = "<B>[src]</B> �������."

		if ("grin")
			message = "<B>[src]</B> �����&#255;���&#255;."
			m_type = 1

		if ("jump")
			message = "<B>[src]</B> �������!"
			m_type = 1

		if ("laugh")
			message = "<B>[src]</B> �����&#255;."
			m_type = 2

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> ������� �� [param]."
			else
				message = "<B>[src]</B> �������."
			m_type = 1

		if ("me")
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "� �� �� ������� �� ����� &#255;�����. ������ ��� ��� (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			else
				message = "<B>[src]</B> [message]"

		if ("nod")
			message = "<B>[src]</B> ������."
			m_type = 1

		if ("point")
			if (!src.restrained())
				var/atom/M = null
				if (param)
					for (var/atom/A as mob|obj|turf in view())
						if (param == A.name)
							M = A
							break
				if (!M)
					message = "<B>[src]</B> points."
				else
					pointed(M)
			m_type = 1

		if ("scream")
			message = "<B>[src]</B> ������!"
			m_type = 2

		if ("shake")
			message = "<B>[src]</B> ��&#255;�� �������."
			m_type = 1

		if ("sigh")
			message = "<B>[src]</B> ��������."
			m_type = 2

		if ("sit")
			message = "<B>[src]</B> ������&#255;."
			m_type = 1

		if ("smile")
			message = "<B>[src]</B> ��������&#255;."
			m_type = 1

		if ("sneeze")
			message = "<B>[src]</B> ������."
			m_type = 2

		if ("sniff")
			message = "<B>[src]</B> ������� �����."
			m_type = 2

		if ("snore")
			message = "<B>[src]</B> "
			message += pick("������.", "�����.", "�����������.", "���������&#255; �� ���.")
			m_type = 2

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> ������� �� [param]."
			else
				message = "<B>[src]</B> ������� �� ��������."

		if ("sulk")
			message = "<B>[src]</B> �������&#255;."
			m_type = 1

		if ("sway")
			message = "<B>[src]</B> ����������� �������&#255;."
			m_type = 1

		if ("tremble")
			message = "<B>[src]</B> ������ � ������!"
			m_type = 1

		if ("twitch")
			message = "<B>[src]</B> ��������� �������&#255;."
			m_type = 1

		if ("twitch_s")
			message = "<B>[src]</B> �������&#255;."
			m_type = 1

		if ("wave")
			message = "<B>[src]</B> ����� �����."
			m_type = 1

		if ("whimper")
			message = "<B>[src]</B> ������."
			m_type = 2

		if ("yawn")
			message = "<B>[src]</B> ������."
			m_type = 2

		if ("help")
			src << "������ ������. �� ������ ������������ ��, ������ \"*emote\" � \"say\":\naflap, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, dance, deathgasp, drool, flap, frown, gasp, giggle, glare-(none)/mob, grin, jump, laugh, look, me, nod, point-atom, scream, shake, sigh, sit, smile, sneeze, sniff, snore, stare-(none)/mob, sulk, sway, tremble, twitch, twitch_s, wave, whimper, yawn"

		else
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "� ���-�� ������ ��� ��������."
					return
				if (src.client.handle_spam_prevention(act,MUTE_IC))
					return
			if (stat)
				return
			if(!(act))
				return
			else
				message = "<B>[src]</B> [act]"

	if (message)
		log_emote("[ckey]/[name] : [message]")

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in dead_mob_list)
			if(!M.client || istype(M, /mob/new_player))
				continue //skip monkeys, leavers and new players
			var/T = get_turf(src)
			if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(T,null)))
				M.show_message(message)


		if (m_type & 1)
			visible_message(message)
		else if (m_type & 2)
			audible_message(message)
